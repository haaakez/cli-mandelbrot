## cli mandelbrot renderer
![Preview](recordings/preview.gif)

## build and run

requires linux x86-64, gcc and mpfr

```sh
gcc -O2 -no-pie mandelbrot.s -lmpfr -o mandelbrot
./mandelbrot
```
