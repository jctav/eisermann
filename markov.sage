import sage.all 
from collections import deque

def markov_BFS(B, depth=1):
    visited = {}
    queue = deque()

    cur_depth = 0
    queue.append([B, cur_depth])

    while cur_depth < depth and len(queue) > 0:
        cur_braid, cur_depth = queue.popleft()
        if cur_braid in visited or cur_depth >= depth:
            continue

        visited[cur_braid] = cur_depth

        # Perform markov move
        M1A = markov_move(cur_braid, (1,'A'))
        queue.append([M1A, cur_depth+1])

        M1B = markov_move(cur_braid, (1,'B'))
        queue.append([M1B, cur_depth+1])

        M_1 = markov_move(cur_braid, (-1,'AB'))
        queue.append([M_1, cur_depth+1])

        for k in range(1, cur_braid.strands()):
            M2A = markov_move(cur_braid, (2, 'A', k))
            queue.append([M2A, cur_depth+1])

            M2B = markov_move(cur_braid, (2, 'B', k))
            queue.append([M2B, cur_depth+1])

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

    if move[0] == -1:
        if abs(tietze[-1])+1 == n_strands:
            c1 = tietze.count(n_strands-1)
            c2 = tietze.count(-(n_strands-1))
            if c1+c2 == 1:
                idx = -tietze[-1]
                tietze = tietze + [idx]
        
    return BraidGroup(n_strands)(tietze)
