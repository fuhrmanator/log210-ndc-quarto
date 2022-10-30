# embed-svg.py
from pandocfilters import toJSONFilter, Image, RawInline

def embed_svg(key, value, format, meta):
  if key == 'Image':
    attrs, caption, (url, title) = value
    if url.endswith('.svg'):
        svg_content = open(url, mode='r').read()
        return RawInline("html5", f"<svg>\n{svg_content}\n</svg>\n") # requires python 3.6 for f-strings

if __name__ == "__main__":
  toJSONFilter(embed_svg)