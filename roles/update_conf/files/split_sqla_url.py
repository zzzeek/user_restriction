from __future__ import print_function

from sqlalchemy.engine import url
import sys

u = url.make_url(sys.argv[1])

print("|".join(
    [u.get_backend_name() or '', u.username or '', u.host or '',
     u.database, u.query.get("read_default_group", '')]
))
