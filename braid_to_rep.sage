import sage.all 

def braid_to_rep(B):
    num_gens = B.strands() + 1 # Plus the meridian
    F = FreeGroup(['m'] + ['y' + str(i+1) for i in range(num_gens-1)])

    F_gens = list(F.gens())
    relations = list(F.gens())
    relations[1] = F.one() # y1 is known to be 1

    braid_word = B.Tietze()
    for sigma in braid_word:
        idx = abs(sigma)
        y_l = relations[idx]   # y_{t}
        y_r = relations[idx+1] # y_{t+1}
        m = relations[0]

        if sigma > 0:
            relations[idx] = m^-1 * y_r * y_l^-1 * m * y_l
            relations[idx+1] = y_l
        else:
            relations[idx] = y_r
            relations[idx+1] = m * y_l * y_r^-1 * m^-1 * y_r

    l = relations[1]             # longitude
    relations[1] = F_gens[1]     # because y_1 = 1

    for i in range(2, num_gens):
        relations[i] = relations[i] * F_gens[i]^-1

    return F.quotient(relations[1:]), l
