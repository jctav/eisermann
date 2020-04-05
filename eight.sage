from build.eisermann import eisermann
from build.braid_to_rep import braid_to_rep

import sage.all
from sage.groups.braid import BraidGroup
from sage.groups.perm_gps.permgroup_named import SymmetricGroup

S = SymmetricGroup(5)
x = S.gens()[0]

eight_braid = BraidGroup(3)([1,-2,1,-2])
K, l = braid_to_rep(eight_braid)

print('Eight')
print('K: ' + str(K))
print('S: ' + str(S))
print('x: ' + str(x))
print('l: ' + str(l))
eisermann(K, S, x, l)

mirror_braid = BraidGroup(3)([-1,2,-1,2])
K2, l2 = braid_to_rep(mirror_braid)

print('Mirror')
print('K: ' + str(K2))
print('S: ' + str(S))
print('x: ' + str(x))
print('l: ' + str(l2))
eisermann(K2, S, x, l2)
