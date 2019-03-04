#!/usr/bin/env python3
from collections import Counter
import matplotlib.pyplot as plt
import numpy as np
#from scipy import fftpack
from scipy.fftpack import rfft, irfft, fftfreq

bases = ['A', 'C', 'G', 'T']

myfile = "94N_bound_cyc4.txt"

all_freq = {'A':[0]*95, 'C':[0]*95, 'G':[0]*95, 'T':[0]*95}

## Counts the number of reads
#reads = 0
#with open(myfile) as infile:
#    for line in infile:
#        reads += 1

## Figures out how common each base is at each position of the sequence
#read = 0
#with open(myfile) as infile:
#    for line in infile:
#        seq = list(line) # Converts string to list so that I can manipulate it easily
#        freq = {} # Like all_freq, but just for this read
#        for base in bases:
#            freq[base] = [1 if ii == base else 0 for ii in seq]
#        # Adds frequencies to all_freq
#        for key in all_freq:
#            all_freq[key] = [x + y for x, y in zip(all_freq[key], freq[key])]
#        print(100*(read/reads)) # progress bar of what % of reads we've gone through so far
#        read += 1

#print(all_freq)

# UNBOUND
#all_freq = {'T': [1287716, 1225194, 1156682, 1110689, 1125732, 1142366, 1312209, 1201577, 1219023, 1282819, 1213248, 1216957, 1222767, 1255513, 1334470, 1247516, 1184918, 1245647, 1249723, 1249977, 1248308, 1274070, 1269002, 1312442, 1224406, 1250947, 1281975, 1224402, 1237895, 1233339, 1250952, 1214163, 1258786, 1262097, 1243813, 1230019, 1202457, 1206780, 1218617, 1184308, 1256999, 1242201, 1240473, 1218974, 1220485, 1239527, 1202326, 1206995, 1192759, 1199801, 1197279, 1226114, 1195686, 1164875, 1177681, 1144133, 1188561, 1176952, 1119332, 1167358, 1091217, 1173746, 1141398, 1126776, 1132966, 1136557, 1165058, 1144343, 1129104, 1104756, 1135233, 1118712, 1097553, 1092249, 1116829, 1095057, 1068936, 1126911, 1141726, 1117717, 1072563, 1079604, 1045069, 1084288, 1048058, 1059161, 1039406, 1049951, 1095205, 1129080, 1066431, 1009795, 1003395, 842672], 'A': [1025169, 977209, 966532, 978617, 1022877, 1018577, 950455, 1050233, 999900, 903620, 975640, 1002422, 958513, 969876, 919187, 974867, 1028301, 970129, 967426, 977682, 975438, 983726, 976479, 942146, 939843, 955822, 935225, 994122, 964958, 977598, 950789, 987647, 918337, 966224, 1001456, 945408, 1002184, 956591, 918085, 989465, 931434, 949450, 939310, 977908, 935712, 886446, 908305, 935557, 948040, 989111, 995794, 928858, 946906, 939870, 923605, 935487, 934071, 941726, 976633, 935871, 988358, 940275, 946830, 892375, 925733, 946199, 884106, 871380, 900526, 934561, 910426, 923916, 918742, 957841, 889550, 869274, 908671, 856815, 861528, 848968, 875198, 841322, 910715, 837335, 817250, 830352, 800814, 771508, 727859, 653357, 765726, 691051, 717763, 884458], 'C': [976734, 961759, 952384, 981149, 950064, 932299, 878997, 873365, 910952, 962208, 944622, 910813, 941041, 916839, 903297, 915220, 922571, 908932, 894198, 900967, 900313, 862119, 871992, 869479, 918923, 888188, 887351, 917047, 906234, 900159, 887347, 880806, 916464, 879848, 861053, 883125, 908262, 894962, 925859, 898223, 887628, 884226, 875566, 867562, 914922, 915297, 929899, 891273, 862154, 886750, 829245, 851146, 885384, 897901, 924406, 932826, 931274, 920268, 911964, 930104, 899638, 901464, 935898, 921595, 913290, 891632, 886465, 913500, 931848, 896315, 892141, 855743, 915655, 874208, 902501, 929953, 905416, 924959, 918439, 922005, 932327, 910726, 886119, 891200, 905321, 908506, 920199, 946691, 953024, 1041464, 1035182, 1038775, 983839, 854096], 'G': [1209955, 1335413, 1423966, 1429120, 1400902, 1406333, 1357914, 1374400, 1369700, 1350928, 1366065, 1369383, 1377254, 1357347, 1342621, 1361972, 1363785, 1374867, 1388228, 1370949, 1375516, 1379660, 1382102, 1375508, 1416335, 1404526, 1394979, 1363940, 1390423, 1388219, 1410482, 1416959, 1405988, 1391406, 1393253, 1441023, 1386672, 1441242, 1437014, 1427579, 1423514, 1423698, 1444226, 1435131, 1428456, 1458305, 1459045, 1465750, 1496622, 1423913, 1477257, 1493457, 1471599, 1496929, 1473883, 1487129, 1445669, 1460629, 1491646, 1466242, 1520362, 1484090, 1475449, 1558829, 1527586, 1525187, 1563946, 1570352, 1538097, 1563943, 1561775, 1601204, 1567625, 1575277, 1590695, 1605291, 1616552, 1590890, 1577882, 1610884, 1619469, 1667923, 1657672, 1686752, 1728946, 1701556, 1739156, 1731423, 1723487, 1675674, 1632236, 1759954, 1794578, 1918347]}

# BOUND
all_freq = {'A': [319807, 329786, 316508, 315534, 302994, 291726, 292130, 275203, 271641, 276741, 278207, 302539, 313630, 304692, 307086, 299111, 268822, 273037, 276601, 268824, 267201, 283290, 299067, 313419, 297079, 286226, 254508, 262003, 256084, 262195, 258621, 275395, 296146, 290235, 306385, 291204, 259867, 253384, 249343, 261461, 264870, 263316, 270188, 281821, 285909, 286546, 256419, 244378, 226698, 236473, 244782, 248183, 277759, 267253, 286028, 262152, 273333, 257477, 252802, 255677, 243555, 273874, 261928, 251271, 266222, 282281, 259396, 244595, 259146, 246524, 256960, 247275, 258512, 257577, 286777, 275108, 259066, 260974, 237580, 233426, 220481, 226793, 237336, 255182, 255462, 246420, 244094, 234329, 227657, 201191, 227640, 233433, 230337, 216365], 'T': [387156, 344692, 358486, 338659, 353591, 358763, 349591, 380976, 360605, 370345, 369283, 354460, 343773, 340347, 340879, 335920, 347806, 357822, 352118, 361073, 374773, 355654, 338864, 334047, 327781, 323890, 344093, 337157, 343607, 355073, 356548, 349004, 325820, 319671, 311102, 316052, 315635, 331196, 336711, 348016, 348521, 334067, 332629, 316740, 307909, 303580, 297760, 315878, 324526, 337310, 355023, 340322, 326024, 324110, 300694, 294808, 303197, 307553, 318522, 318080, 323917, 323227, 333582, 322050, 298377, 275119, 291896, 295604, 303628, 322309, 324402, 337822, 322966, 308375, 287251, 278197, 282870, 276843, 298802, 307958, 336603, 335838, 324610, 299459, 287512, 262338, 258813, 267438, 276055, 314365, 315634, 309829, 303081, 313949], 'C': [246178, 251132, 255577, 244660, 253933, 256439, 264173, 258713, 280590, 271930, 277145, 262438, 250870, 261715, 260585, 257770, 274621, 270481, 279756, 284097, 274739, 269277, 256972, 247210, 242124, 262874, 279935, 287779, 292051, 282413, 288668, 275189, 259692, 264316, 265203, 249289, 275446, 275270, 296295, 290956, 281264, 285477, 267707, 274182, 270612, 257457, 283935, 284514, 302295, 307016, 267279, 289366, 267985, 277752, 264802, 270829, 267457, 295643, 303267, 305073, 306701, 284196, 281947, 275857, 265762, 267146, 270164, 288831, 284964, 294105, 281950, 285024, 293246, 273417, 260303, 263639, 273662, 289165, 310060, 306251, 301308, 305326, 281121, 282343, 256715, 278261, 279420, 281045, 295609, 311571, 293228, 278484, 268985, 363374], 'G': [346770, 374301, 369337, 401058, 389393, 392983, 394017, 385019, 387075, 380895, 375276, 380474, 391638, 393157, 391361, 407110, 408662, 398571, 391436, 385917, 383198, 391690, 405008, 405235, 432907, 426896, 421365, 412951, 408151, 400158, 396072, 400323, 418253, 425689, 417221, 443366, 448963, 440061, 417562, 399478, 405256, 417051, 429387, 427168, 435481, 452328, 461797, 455141, 446392, 419112, 432827, 422040, 428143, 430796, 448387, 472122, 455924, 439238, 425320, 421081, 425738, 418614, 422454, 450733, 469550, 475365, 478455, 470881, 452173, 436973, 436599, 429790, 425187, 460542, 465580, 482967, 484313, 472929, 453469, 452276, 441515, 431954, 456844, 462927, 500222, 512892, 517584, 517099, 500590, 472784, 463409, 478165, 497508, 406223]}


# Plots frequencies
x = np.arange(0,94,1)
fig, ax = plt.subplots()
for base in bases:
    ax.plot(x, all_freq[base], label=base)
legend = ax.legend()
plt.show()

avg = sum(all_freq['A'])/len(all_freq['A'])

Fs = 94.0
y = [x - avg for x in all_freq['A']]
n = len(y)
k = np.arange(n)
T = n/Fs
frq = k/T
#frq = frq[range(n/2)]

Y = np.fft.fft(y)/n
#Y = Y[range(n/2)]

plt.plot(frq, abs(Y), 'r')

plt.show()
