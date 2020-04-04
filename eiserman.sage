from sage.groups.free_group import FreeGroup
import itertools

def eisermann(K, G, x, l):
    k_gens = K.gens()
    G_elements = [e for e in G]
    combinations = itertools.combinations(G_elements, len(k_gens)-2)

    failed = 0
    for e in combinations:
        try:
            f = K.hom([x, G.one()] + list(e))
            print(f(l))
        except:
            failed += 1

F = FreeGroup(['m', 'y0', 'y1'])
F_gens = F.gens()
relations = [F_gens[1], F_gens[0]^2 * F_gens[2]^-1 * F_gens[0]^-1 * F_gens[2] * F_gens[0]^-1 * F_gens[2]^-1]
K = F.quotient(relations)
l = F_gens[0]^3 * F_gens[2] * F_gens[0]^-1 * F_gens[2]^-1 * F_gens[0]^-1 * F_gens[2] * F_gens[0]^-1

relations2 = [F_gens[1], F_gens[0]^-3 * F_gens[2]^-1 * F_gens[0] * F_gens[2] * F_gens[0] * F_gens[2]^-1 * F_gens[0] * F_gens[2] * F_gens[2]^-1]
K2 = F.quotient(relations2)
l2 = F_gens[0]^-2 * F_gens[2] * F_gens[0] * F_gens[2]^-1 * F_gens[0] * F_gens[2]

S = SymmetricGroup(5)
x = S.gens()[0]

print('Trefoil')
print('K: ' + str(K))
print('S: ' + str(S))
print('x: ' + str(x))
print('l: ' + str(l))
eisermann(K, S, x, l)

print()

print('Mirror')
print('K: ' + str(K2))
print('S: ' + str(S))
print('x: ' + str(x))
print('l: ' + str(l2))
eisermann(K2, S, x, l2)
