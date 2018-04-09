#!/bin/env python
# -*- coding: utf-8 -*-

n = int(raw_input('how many datanode do you want? '))

with open('./region.yaml') as f:
    with open('./region-gen.yaml', 'w') as genf:
        yaml = f.read()
        for i in range(n):
            gen = yaml.replace('hbase-region-0', 'hbase-region-%d' % i)
            genf.write(gen)
            genf.write('---\n')
            genf.flush()
