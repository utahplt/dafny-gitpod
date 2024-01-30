method LinearSearch(a:array<int>, e:int)
returns (r:bool)
  ensures r <==> exists k::
                  0 <= k && k < a.Length && a[k] == e
{
  var i := 0;
  while (i < a.Length)
  invariant i <= a.Length
  invariant forall k::
              0 <= k < i ==> a[k] != e
  {
    if (a[i] == e)
    {
      return true;
    }
    i := i + 1;
  }
  return false;
}
