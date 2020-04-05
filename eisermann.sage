def eisermann(K, G, x, l):
    k_gens = K.gens()
    G_elements = [e for e in G]

    import itertools
    comb = itertools.combinations_with_replacement(G_elements, len(k_gens)-2)

    failed = 0
    for e in comb:
        try:
            f = K.hom([x, G.one()] + list(e))
            print(f(l))
        except:
            failed += 1
