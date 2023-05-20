module Tree = {
    type rec btree<'a> = 
    | Leaf 
    | Node(btree<'a>, 'a, btree<'a>)

    let rec to_list = (tree: btree<'a>): list<'a> =>
        switch (tree) {
        | Leaf => list{}
        | Node(left, value, right) =>
        let leftList = to_list(left);
        let rightList = to_list(right);
        let ret = Belt.List.concat(leftList, list{value});
        Belt.List.concat(ret,rightList)
        }
}