import sage.all 

def braid_to_rep(B):
    num_gens = B.strands() + 1
    F = FreeGroup(['m'] + ['y' + str(i+1) for i in range(num_gens-1)])

    F_gens = list(F.gens())
    relations = list(F.gens())
    relations[1] = F.one()

    twists = B.Tietze()
    for t in twists:
        print(relations)
        y_t = relations[abs(t)]
        y_t_1 = relations[abs(t)+1]
        m = relations[0]

        if t > 0:
            relations[t+1] = y_t
            relations[t] = m * y_t_1 * y_t^-1 * m^-1 * y_t
        else:
            relations[abs(t)] = y_t_1
            relations[abs(t)+1] = m^-1 * y_t * y_t_1^-1 * m * y_t_1

    l = relations[1]
    relations[1] = F_gens[1]
    for i in range(2, num_gens):
        relations[i] = relations[i] * F_gens[i]^-1

    return F.quotient(relations[1:]), l
