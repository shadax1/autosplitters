# LiveSplit autosplitters

The general logic behind these is heavily based on magmapeach's Cave Story autosplitter.

## Gensokyo no Nazo
`gnazo - character get.asl` and `gnazo - room change.asl` both support gnazo versions 1.00 and 1.01. The former splits upon character get and the latter splits upon loading the next room after beating a boss.

## Koumajou Densetsu II (aka Touhouvania 2)
`kd2.asl` supports versions 1.02 and 1.02a. The `SplitRemilia` option doesn't work very well and might reset your splits.

## MegaMari
To my knowledge, there should only be one version of the game out there. Splits on teleport.

## Remidoki
`remidoki.asl` and `remidoki.lua` can be used with LiveSplit and LibreSplit respectively.

You might have to edit the name of the process. The one I use is simply `remidoki.exe`. If you play the English version of the game, then you likely will have to replace it with `remidoki_e.exe`.

## Rosenkreuzstilette & Rosenkreuzstilette Freudenstachel
`rks.asl` supports versions 1.05c and 1.06a of the non-Steam release as well as version 2.02c of the Steam release.

`rksf.asl` supports version 1.04a of the non-Steam release and version 2.03b of the Steam release.

Both of them split on teleport after beating a boss.
