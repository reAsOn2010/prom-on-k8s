#!/bin/env python
# -*- coding: utf-8 -*-

n = int(raw_input('how many datanode do you want? '))

with open('./datanode.yaml') as f:
    with open('./datanode-gen.yaml', 'w') as genf:
        yaml = f.read()
        for i in range(n):
            gen = yaml.replace('hadoop-datanode-0', 'hadoop-datanode-%d' % i)
            genf.write(gen)
            genf.write('---\n')
            genf.flush()
