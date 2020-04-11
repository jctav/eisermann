import sage.all 
from collections import deque

def markov_BFS(B, depth=1):
    visited = {}
    queue = deque()

    cur_depth = 0
    visited[B] = cur_depth
    queue.append([B, B.strands(), cur_depth])

    # TODO
    while cur_depth < depth:
        cur_braid, cur_sz, cur_depth = queue.popleft()
        if cur_braid in visited:
            continue

        visited[cur_braid] = cur_depth

        # Perform markov move
        M1A = [cur_braid.copy().append(-cur_sz), cur_sz+1, cur_depth+1]
        M1B = [cur_braid.copy().append(cur_sz), cur_sz+1, cur_depth+1]

        for k in range(1, cur_sz):
            M2A = [cur_braid.copy().append(-cur_sz), cur_sz+1, cur_depth+1]

    return visited

def markov_move(braid, move):
    tietze = list(braid.Tietze())
    n_strands = braid.strands()

    if move[0] == 1:
        idx = n_strands
        idx = -idx if move[1] == 'A' else idx
        tietze = [idx] + tietze
        n_strands += 1

    if move[0] == 2:
        idx = move[2]
        idx = -idx if move[1] == 'A' else idx
        tietze = [idx] + tietze + [-idx]

    return BraidGroup(n_strands)(tietze)
