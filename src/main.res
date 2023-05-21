open Set
open Tree
open Base

let myArray = [1, 2, 3, 4, 5]
let mySet = Set.make(myArray)

Js.log(mySet) // 输出 [|1, 2, 3, 4, 5|]
 

let tr: Tree.tree<Base.number> = Node(Leaf, Int(5), Node(Leaf, Int(6), Leaf))
Js.log(Tree.list_tree(tr));
Js.log(Tree.bst(tr))

let tr: Tree.mtree<Base.number> = Node(Leaf, Int(5),Int(5), Node(Leaf, Int(6),Int(6), Leaf))
Js.log(Tree.set_mtree(tr));
// Js.log(Tree.bst(tr))