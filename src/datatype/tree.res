open Set
open Utils
open Base

module Tree = {
    type rec tree<'a> = 
    | Leaf 
    | Node(tree<'a>, 'a, tree<'a>)

    let rec list_tree = (tree: tree<'a>): list<'a> =>
        switch (tree) {
        | Leaf => list{}
        | Node(left, value, right) =>
        let leftList = list_tree(left);
        let rightList = list_tree(right);
        let ret = Belt.List.concat(leftList, list{value});
        Belt.List.concat(ret,rightList)
        }
    
    let rec set_tree = (tree: tree<'a>): Set.t<'a> => {
        switch(tree){
            | Leaf =>Set.empty()
            | Node(l,a,r) => {
                let s1 = Set.insert(~item=a,~set=set_tree(l));
                Set.union(s1,set_tree(r))
            }
        
        }
    
    }
    
    
    let rec bst = (tree: tree<Base.number>): bool =>{
        switch (tree){
            | Leaf => true
            | Node(l,a,r) =>  {
                let lt = (x) => x<=a;
                let gt = (x) => x>=a;
                 Utils.all(lt,set_tree(l)) &&Utils.all(gt,set_tree(r)) && bst(l) && bst (r)
            }
        
        }
    
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