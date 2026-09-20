#!/usr/bin/env python3
"""Package working-state PNG cursors in the documented Hyprcursor .hlc format."""
from pathlib import Path
from zipfile import ZipFile, ZIP_DEFLATED, ZipInfo

ROOT = Path(__file__).resolve().parents[1]
for name, source in [('Vivian', 'source'), ('Vivian_umbrella', 'source-umbrella')]:
    target = ROOT / name / 'hyprcursors'
    target.mkdir(parents=True, exist_ok=True)
    for shape in sorted((ROOT / source / 'hyprcursors').iterdir()):
        if not shape.is_dir():
            continue
        with ZipFile(target / (shape.name + '.hlc'), 'w', ZIP_DEFLATED) as archive:
            for file in sorted(shape.iterdir()):
                info = ZipInfo(file.name, (2026, 1, 1, 0, 0, 0))
                info.compress_type = ZIP_DEFLATED
                info.external_attr = 0o100644 << 16
                archive.writestr(info, file.read_bytes())
    print(f'Packed {name}: {len(list(target.glob("*.hlc")))} Hyprcursor shapes.')
