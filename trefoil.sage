from build.eisermann import eisermann
from build.braid_to_rep import braid_to_rep

from sage.groups.braid import BraidGroup
from sage.groups.free_group import FreeGroup

"""
F = FreeGroup(['m', 'y1', 'y2'])
F_gens = F.gens()
relations = [F_gens[1], F_gens[0]^2 * F_gens[2]^-1 * F_gens[0]^-1 * F_gens[2] * F_gens[0]^-1 * F_gens[2]^-1]

K = F.quotient(relations)
l = F_gens[0]^3 * F_gens[2] * F_gens[0]^-1 * F_gens[2]^-1 * F_gens[0]^-1 * F_gens[2] * F_gens[0]^-1

relations2 = [F_gens[1], F_gens[0]^-3 * F_gens[2]^-1 * F_gens[0] * F_gens[2] * F_gens[0] * F_gens[2]^-1 * F_gens[0] * F_gens[2] * F_gens[2]^-1]
K2 = F.quotient(relations2)
l2 = F_gens[0]^-2 * F_gens[2] * F_gens[0] * F_gens[2]^-1 * F_gens[0] * F_gens[2]
"""

S = SymmetricGroup(5)
x = S.gens()[0]

trefoil_braid = BraidGroup(2)([1,1,1])
K, l = braid_to_rep(trefoil_braid)

print('Trefoil')
print('K: ' + str(K))
print('S: ' + str(S))
print('x: ' + str(x))
print('l: ' + str(l))
eisermann(K, S, x, l)

print()

mirror_braid = BraidGroup(2)([-1,-1,-1])
K2, l2 = braid_to_rep(mirror_braid)

print('Mirror')
print('K: ' + str(K2))
print('S: ' + str(S))
print('x: ' + str(x))
print('l: ' + str(l2))
eisermann(K2, S, x, l2)
