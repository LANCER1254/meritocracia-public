import os
import webbrowser

DATA = {}

def generate_mermaid(data):
    if not data:
        return "graph TD\n  EMPTY[白紙チャート]"
    diagram = ["graph TD"]
    for node_id, info in data.items():
        title = info.get("title", node_id)
        diagram.append(f"  {node_id}[{title}]")
        nxt = info.get("next")
        if nxt:
            if isinstance(nxt, str):
                diagram.append(f"  {node_id} --> {nxt}")
            elif isinstance(nxt, dict):
                for choice, next_id in nxt.items():
                    diagram.append(f"  {node_id} -- {choice} --> {next_id}")
    return "\n".join(diagram)

HTML_TMPL = """<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>Scenario Chart Pipeline</title>
<style>
body {{ margin: 0; padding: 32px; background: #fff; }}
.mermaid {{ display: flex; justify-content: center; }}
</style>
</head>
<body>
<pre class="mermaid">
{mermaid_code}
</pre>
<script type="module">
import mermaid from 'https://cdn.jsdelivr.net/npm/mermaid@10/dist/mermaid.esm.min.mjs';
mermaid.initialize({{ startOnLoad: true, theme: 'neutral' }});
</script>
</body>
</html>
"""

def main():
    out = "blank_chart.html"
    code = generate_mermaid(DATA)
    with open(out, "w", encoding="utf-8") as f:
        f.write(HTML_TMPL.format(mermaid_code=code))
    print(f"Generated: {out}")
    webbrowser.open(f"file://{os.path.abspath(out)}")

if __name__ == "__main__":
    main()
