int main()
{
	return fib2(31);
}

int fib_rec (int fx, int fx_1, int remaining)
{
  if (remaining == 0)
    return fx;
  return fib_rec( fx + fx_1, fx, remaining - 1 );
}

int fib2 (int x)
{
  if (x < 0)
    return 0;
  if (x <= 1)
    return x;
  return fib_rec( 1, 0, x - 1 );
}
