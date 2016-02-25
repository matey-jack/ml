#!/usr/bin/python3
# -*- coding: utf-8 -*-
import pandas as pd

estates = pd.read_csv('real-estates-utf8.csv')
estates = estates[['Immobilientyp', 'Stadt Kreis', 'Kaufpreis', 'Mietekalt', 'Wohnfläche', 'Zimmeranzahl']]


