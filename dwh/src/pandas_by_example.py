whg.miete_qm' = whg.miete / whg.fläche    # no effect
whg['miete_qm'] = whg.miete / whg.fläche    # triggers warning, but works as intended, MY CHOICE
whg.loc['miete_qm'] = whg.miete / whg.fläche   # triggers warning, no effect
whg.loc[:,'miete_qm'] = whg.miete / whg.fläche    # suggested by documentation,triggers two warnings, but works as intended

# ggf. probieren, falls es Schwierigkeiten mit dem anderen Axenkonzept gibt
plot(secondary_y=True)

'''
xlim/ylim und xticks/yticks muss man vor dem .plot() setzen (sonst wird es ignoriert),
Legend und Grid muss aber danach kommen (sonst wird es auch ignoriert).
Eine Fehlermeldung gibt es dabei nur bei der Legende, die wenn zu früh aufgerufen gar
keine Inhalte findet, die sie zeichnen kann.

'''
