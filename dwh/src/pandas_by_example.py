whg.miete_qm' = whg.miete / whg.fläche    # no effect
whg['miete_qm'] = whg.miete / whg.fläche    # triggers warning, but works as intended, MY CHOICE
whg.loc['miete_qm'] = whg.miete / whg.fläche   # triggers warning, no effect
whg.loc[:,'miete_qm'] = whg.miete / whg.fläche    # suggested by documentation,triggers two warnings, but works as intended


