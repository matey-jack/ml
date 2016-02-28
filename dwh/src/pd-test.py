#!/usr/bin/python3
# -*- coding: utf-8 -*-
import pandas as pd

estates = pd.read_csv('miete.csv')

whg = estates[estates['typ'] == 'Wohnung']
haus = estates[estates['typ'] == 'Haus']

print(whg.groupby('weekday').aggregate(count))

