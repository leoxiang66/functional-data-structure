open Set

module Tree = {
    type rec tree<'a> = 
    | Leaf 
    | Node(tree<'a>, 'a, tree<'a>)

    let rec to_list = (tree: tree<'a>): list<'a> =>
        switch (tree) {
        | Leaf => list{}
        | Node(left, value, right) =>
        let leftList = to_list(left);
        let rightList = to_list(right);
        let ret = Belt.List.concat(leftList, list{value});
        Belt.List.concat(ret,rightList)
        }


    type rec mtree<'a> = 
    | Leaf 
    | Node (mtree<'a>, 'a, 'a, mtree<'a>)


    let rec set_mtree = (tree: mtree<'a>): Set.t<'a> => {
    switch tree {
    | Leaf => Set.empty()
    | Node (l,m,a,r) => 
        {
            let subset1 = Set.insert(~item = a, ~set = set_mtree(l));
            let subset2 = set_mtree(r);
            Set.union(subset1,subset2)
        }
        
    }
    }

}