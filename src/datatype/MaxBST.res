type max_bst<'a> =
  | Empty
  | Node('a, 'a, max_bst<'a>, max_bst<'a>) // (node_value, subtree_max, left, right)

let createEmptyMaxBST = () => Empty

let rec insert = (tree: max_bst<'a>, value: 'a) => {
  switch tree {
  | Empty => Node(value, value, Empty, Empty)
  | Node(nodeValue, subtreeMax, left, right) =>
    if value < nodeValue {
      // 插入到左子树，最大值不变
      let newLeft = insert(left, value)
      Node(nodeValue, subtreeMax, newLeft, right)
    } else {
      // 插入到右子树，并更新最大值
      let newRight = insert(right, value)
      let newSubtreeMax = max(value, subtreeMax) // 使用max函数来更新子树的最大值
      Node(nodeValue, newSubtreeMax, left, newRight)
    }
  }
}


let getMax = (tree: max_bst<'a>) => {
  switch tree {
  | Empty => failwith("Empty tree has no maximum")
  | Node(_, subtreeMax, _, _) => subtreeMax
  }
}


let rec contains = (t: max_bst<'a>, value: 'a) => {
  switch t {
  | Empty => false
  | Node(x, _, left, right) =>
    if value === x {
      true
    } else if value < x {
      contains(left, value)
    } else {
      contains(right, value)
    }
  }
}


let rec printTree = (t: max_bst<'a>) => {
  switch t {
  | Empty => ()
  | Node(x, _, left, right) => {
      printTree(left) // 先打印左子树
      Js.log(x) // 打印当前节点的值
      printTree(right) // 打印右子树
    }
  }
}


let rec remove = (t: max_bst<'a>, value: 'a) => {
  switch t {
  | Empty => Empty
  | Node(x, m, l, r) =>
    if value === x {
      match (l, r) {
      | (Empty, _) => r
      | (_, Empty) => l
      | _ => let (newRight, maxRight) = removeMax(r)
             Node(maxRight, getMax(newRight), l, newRight)
      }
    } else if value < x {
      Node(x, m, remove(l, value), r)
    } else {
      let newRight = remove(r, value)
      let newMax = match newRight {
      | Empty => x
      | Node(_, maxRight, _, _) => max(maxRight, x)
      }
      Node(x, newMax, l, newRight)
    }
  }
}

let rec removeMax = (t: max_bst<'a>): (max_bst<'a>, 'a) => {
  switch t {
  | Empty => failwith("Should never call removeMax on an empty tree")
  | Node(value, _, _, Empty) => (Empty, value) // 最大节点被移除
  | Node(value, maxVal, left, right) => {
      let (newRight, maxRightValue) = removeMax(right)
      let newMax = match newRight {
      | Empty => getMin(left) // 新的右子树为空，取左子树的最大值
      | Node(_, newMax, _, _) => newMax
      }
      (Node(value, newMax, left, newRight), maxRightValue)
    }
  }
}
