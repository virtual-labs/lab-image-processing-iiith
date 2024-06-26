# Compiling all the simulation exectuables
# to be run inside the docker container

cd /var/www/html/exp/image-arithmetic/simulation
chmod +x compile.sh && ./compile.sh

cd /var/www/html/exp/affine-transformation/simulation
chmod +x compile.sh && ./compile.sh

cd /var/www/html/exp/point-operations/simulation
chmod +x compile.sh && ./compile.sh

cd /var/www/html/exp/neighbourhood-operations/simulation
chmod +x compile.sh && ./compile.sh

cd /var/www/html/exp/image-histogram/simulation
chmod +x compile.sh && ./compile.sh

cd /var/www/html/exp/fourier-transform/simulation
chmod +x compile.sh && ./compile.sh

cd /var/www/html/exp/morphological-operations/simulation
chmod +x compile.sh && ./compile.sh

cd /var/www/html/exp/image-segmentation/simulation
chmod +x compile.sh && ./compile.sh

cd /var/www/html/exp/image-processing-test-bench/simulation
chmod +x compile.sh && ./compile.sh
