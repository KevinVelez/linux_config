#!/usr/bin/env python3
#
# Copyright (C) 2021 Kevin Velez
# Licensed under the GPL version 2 only
#
# A battery indicator blocklet script for i3blocks

import re
from subprocess import check_output

battery = check_output(['acpi'],universal_newlines=True).split()

status = battery[2].split(',')[0]
charge = battery[3].split('%')[0]

if status == 'Charging':
    status = ''
elif status == 'Full':
    status = ' '
else:
    status = ''

nc = int(charge)

if nc > 80:
    status += ''
elif nc > 60:
    status += ''
elif nc > 40:
    status  += ''
elif nc > 20:
    status += ''
else:
    status += ''

fulltext = status + ' ' + charge + '%'

print(fulltext)
