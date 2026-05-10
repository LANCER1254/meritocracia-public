#!/usr/bin/env python3
from pathlib import Path
import re
import sys

LEDGER_PATH = Path("docs/viewer/共有用/小説レビューレポート/review-ledger.html")


def get_no(row: str) -> int:
    match = re.search(r"<td>\s*(\d+)\s*</td>", row)
    return int(match.group(1)) if match else 999999


def main() -> int:
    if not LEDGER_PATH.exists():
        print(f"ERROR: 台帳が見つかりません: {LEDGER_PATH}", file=sys.stderr)
        return 1

    text = LEDGER_PATH.read_text(encoding="utf-8")

    match = re.search(r"(<tbody>)(.*?)(</table>)", text, re.DOTALL)
    if not match:
        print("ERROR: <tbody> 〜 </table> 範囲が見つかりません", file=sys.stderr)
        return 1

    prefix = text[:match.start()]
    tbody_open = match.group(1)
    table_area = match.group(2)
    table_close = match.group(3)
    suffix = text[match.end():]

    rows = re.findall(r"<tr>.*?</tr>", table_area, re.DOTALL)
    if not rows:
        print("ERROR: 台帳行 <tr> が見つかりません", file=sys.stderr)
        return 1

    rows_sorted = sorted(rows, key=get_no)

    new_text = (
        prefix
        + tbody_open
        + "\n"
        + "\n".join(rows_sorted)
        + "\n</tbody>\n"
        + table_close
        + suffix
    )

    LEDGER_PATH.write_text(new_text, encoding="utf-8")
    print(f"OK: 台帳をNo順に整列しました: {LEDGER_PATH}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
