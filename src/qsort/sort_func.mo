import Debug "mo:base/Debug";
import Array "mo:base/Array";
import Int "mo:base/Int";

func quicksort(arr: [var Int]) : () {
    if (arr.size() > 2) {
        deal(arr, 0, arr.size() - 1);
    };
    // let mutArr: [var Int] = Array.thaw<Int>(arr);

    var i = 0;
    while (i < arr.size()) {
        Debug.print(Int.toText(arr[i]));
        i := i + 1;
    };
};

func deal(arr: [var Int], leftIdx: Nat, rightIdx: Nat) {
    if (leftIdx >= rightIdx) {
        return;
    };
    let partitionIndex = partition(arr, leftIdx, rightIdx);

    if (partitionIndex != 0) {
        deal(arr, leftIdx, partitionIndex - 1);
    };

    deal(arr, partitionIndex + 1, rightIdx);
};

func partition(arr: [var Int], leftIdx: Nat, rightIdx: Nat) : Nat {
    var piviot = leftIdx;
    var index = piviot + 1;
    var i = index;
    while (i <= rightIdx) {
        if (arr[i] < arr[piviot]) {
            swap(arr, i, index);
            index := index + 1;
        };
        i := i + 1;
    };

    swap(arr, piviot, index - 1);
    return index - 1;
};

func swap(mutArr: [var Int], i: Nat, j: Nat) {
    let tmp = mutArr[i];
    mutArr[i] := mutArr[j];
    mutArr[j] := tmp;
};

let tmp: [var Int] = [var 5, 4, 3, 2, 1];
quicksort(tmp);
