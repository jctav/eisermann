#!/usr/bin/env python

import os

for module_name in os.listdir('.'):
    if module_name.endswith('.sage'):
        print(module_name)
        os.system('sage --preparse ' + module_name)
        os.system('mv ' + module_name + '.py build/' + os.path.splitext(module_name)[0] + '.py')
