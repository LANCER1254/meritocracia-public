from pathlib import Path
import csv
import re
import sys

def count_chars(text: str) -> int:
    text = re.sub(r"```[\s\S]*?```", "", text)  # コードブロック除外
    text = re.sub(r"^#+\s*", "", text, flags=re.MULTILINE)  # 見出し記号除外
    text = re.sub(r"\s+", "", text)  # 空白・改行除外
    return len(text)

def main() -> None:
    if len(sys.argv) < 2:
        print("使い方: python3 tools/count_md_chars.py <対象フォルダ>")
        sys.exit(1)

    target = Path(sys.argv[1]).expanduser().resolve()
    if not target.exists() or not target.is_dir():
        print(f"ERROR: フォルダが存在しません: {target}")
        sys.exit(1)

    out_csv = target / "md_wordcount.csv"

    rows = []
    total = 0

    for md in sorted(target.glob("*.md")):
        text = md.read_text(encoding="utf-8")
        count = count_chars(text)
        size = md.stat().st_size
        total += count
        rows.append([md.name, count, size])

    with out_csv.open("w", encoding="utf-8-sig", newline="") as f:
        writer = csv.writer(f)
        writer.writerow(["filename", "chars_no_whitespace", "bytes"])
        writer.writerows(rows)
        writer.writerow([])
        writer.writerow(["TOTAL", total, ""])

    print(f"OK: {out_csv}")
    print(f"files: {len(rows)}")
    print(f"total chars: {total:,}")

if __name__ == "__main__":
    main()
