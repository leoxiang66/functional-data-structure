/*
 在给定的二叉搜索树（BST）实现中，各种操作的时间复杂度主要取决于树的高度。以下是针对每个操作的时间复杂度分析：

### 1. 插入操作 (`insert`)

**操作描述**：插入一个新元素到 BST 中。如果插入的值小于当前节点的值，则递归到左子树；如果大于当前节点的值，则递归到右子树。

**时间复杂度**：
- **最佳情况**：\(O(\log n)\)，这是在树保持平衡时的复杂度，其中 \(n\) 是树中节点的数量。
- **最坏情况**：\(O(n)\)，这种情况发生在树退化成一个链表时，例如当连续插入排序的数据时。

### 2. 查找操作 (`find`)

**操作描述**：在 BST 中查找一个给定值。如果找到目标值，则返回 `true`，否则返回 `false`。查找操作会沿着树的路径向下移动，直到找到相应的值或到达叶子节点。

**时间复杂度**：
- **最佳情况**：\(O(\log n)\)，这是在树保持平衡时的复杂度。
- **最坏情况**：\(O(n)\)，这种情况同样发生在树退化成一个链表时。

### 3. 删除操作 (`remove`)

**操作描述**：从 BST 中删除一个指定的元素。删除操作需要考虑三种情况：节点是叶子节点、节点有一个子节点、节点有两个子节点。删除有两个子节点的节点时，通常需要找到右子树中的最小元素（或左子树中的最大元素）来替代删除节点。

**时间复杂度**：
- **最佳情况**：\(O(\log n)\)，这通常发生在树保持良好平衡的情况下。
- **最坏情况**：\(O(n)\)，当树退化成一个链表，尤其是在连续删除操作影响树的平衡时。

### 4. 中序遍历打印 (`printTree`)

**操作描述**：按照从小到大的顺序打印出 BST 中的所有元素。这通过递归地先访问左子树，然后访问当前节点，最后访问右子树来实现。

**时间复杂度**：
- **总是**：\(O(n)\)，无论树的形状如何，都需要访问树中的每个节点一次。

这些分析突出了 BST 的一个主要缺点：在最坏情况下，性能可能显著下降。这是为什么在需要高效、可预测性能的应用中，通常会选择自平衡的二叉搜索树如 AVL 树或红黑树。
 */


type rec bst<'a> =
  | Empty
  | Node('a, bst<'a>, bst<'a>)


let createEmptyBST = () => Empty

let rec insert = (t: bst<'a>, value: 'a) => {
  switch t {
  | Empty => Node(value, Empty, Empty)
  | Node(x, left, right) =>
    if value < x {
      Node(x, insert(left, value), right)
    } else {
      Node(x, left, insert(right, value))
    }
  }
}

let rec findMin = (t: bst<'a>): 'a => {
  switch t {
  | Empty => failwith("Empty tree has no minimum element")
  | Node(x, Empty, _) => x
  | Node(_, left, _) => findMin(left)
  }
}

let rec remove = (t: bst<'a>, value: 'a): bst<'a> => {
  switch t {
  | Empty => Empty  // 没有找到值，返回空
  | Node(x, left, right) => {
      if value < x {
        Node(x, remove(left, value), right)  // 在左子树中递归删除
      } else if value > x {
        Node(x, left, remove(right, value))  // 在右子树中递归删除
      } else {  // 找到了要删除的节点
        switch (left, right) {
        | (Empty, Empty) => Empty  // 没有子节点，直接删除
        | (Empty, _) => right  // 只有右子节点，用右子树替换
        | (_, Empty) => left   // 只有左子节点，用左子树替换
        | (_, _) =>  // 两个子节点都存在
          let minValue = findMin(right)  // 找到右子树的最小值
          Node(minValue, left, remove(right, minValue))  // 用最小值替换当前节点，并从右子树删除最小值节点
        }
      }
    }
  }
}



let rec contains = (t: bst<'a>, value: 'a) => {
  switch t {
  | Empty => false
  | Node(x, left, right) =>
    if value === x {
      true
    } else if value < x {
      contains(left, value)
    } else {
      contains(right, value)
    }
  }
}



let rec printTree = (t: bst<'a>) => {
  switch t {
  | Empty => () // 如果是空树，什么也不做
  | Node(x, left, right) => {
      printTree(left)          // 先打印左子树
      Js.log(x)                // 打印当前节点的值
      printTree(right)         // 打印右子树
    }
  }
}



