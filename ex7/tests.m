printf("...now running tests...\n")


function test(name, actual, expected)
  printf(" - %s", name);
  if actual != expected
    printf("\n    expected: %d\n", expected);
    printf(  "    but got:  %d\n", actual);
  else
    printf("\n");
  end
end

test("num equals", 1, 1);
%test("unequals", 1, 2);

X = [1, 2, 3];
centroids = [
1 2 3
4 5 6
];
test("perfect find", findClosestCentroids(X, centroids), [1])

X = [1, 2, 3];
centroids = [
1 3 2
1 2 1
];
test("square distance", findClosestCentroids(X, centroids), [1])

X = [1, 2, 3];
centroids = [
1 2 1
1 3 2
];
test("square distance 2", findClosestCentroids(X, centroids), [2])


X = [
1 2 3
4 5 6
7 8 -9
-3 5 -1
];
centroids = [
0 0 0
6 6 6
-5 5 0
];
is = findClosestCentroids(X, centroids);
test("M=4, K=3, x1", is(1), 1)
test("M=4, K=3, x1", is(2), 2)
test("M=4, K=3, x1", is(3), 1)
test("M=4, K=3, x1", is(4), 3)

X = [
 1  2  3
-1 -2  0
 4  5  6
];
idx = [1; 2; 1];
Cs = [
2.5 3.5 4.5
-1  -2  0
];
test("centroids", computeCentroids(X, idx, max(idx)), Cs)


X = [
 1  2 
-1 -2
 4  5
-1 12 
];
idx = [1; 2; 1; 2];
Cs = [
2.5 3.5
-1  5 
];
test("2D centroids", computeCentroids(X, idx, max(idx)), Cs)
