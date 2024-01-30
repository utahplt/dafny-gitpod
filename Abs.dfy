method AbsArray(a:array<int>)
  modifies a
  ensures forall k:: 0 <= k < a.Length ==> a[k] >= 0
{
  var i:int := 0;
  while (i < a.Length)
  invariant i <= a.Length
  invariant forall k:: 0 <= k < i ==> a[k] >= 0
  {
    if (a[i] < 0)
    {
      a[i] := -a[i];
    }
    i := i + 1;
  }
}

