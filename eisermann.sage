def eisermann(K, G, x, l):
    k_gens = K.gens()
    G_elements = [e for e in G]

    import itertools
    combinations = itertools.combinations(G_elements, len(k_gens)-2)

    failed = 0
    for e in combinations:
        try:
            f = K.hom([x, G.one()] + list(e))
            print(f(l))
        except:
            failed += 1
