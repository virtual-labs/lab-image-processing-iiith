# Lab Setup and Containerization

## Build Instructions
The lab contains mulitple experiments which can all be built using the lab management repository.
Follow the steps below to clone the necessary repositories, make required changes, and build the lab.

1. Clone both the lab repository and the lab management repository:
    ```
    git clone https://github.com/virtual-labs/lab-image-processing-iiith.git
    git clone https://github.com/virtual-labs/ph3-lab-mgmt.git
    ```

2. If required, make changes to the `lab-descriptor.json` in the lab repository to update the experiment repositories and their respective tags (version).
   
3. Navigate to the lab management repository and install all necessary dependencies:
    ```
    cd ph3-lab-mgmt
    npm install
    ```
4. Use the following command to build the lab:
    ```
    node main.js buildLab --src=../lab-image-processing-iiith
    ```
5. Navigate to the `List of experiments.html` file in the build folder in the lab directory and replace the href of the list of experiments from the base url to the relative path
    ```
    cd ../lab-image-processing-iiith/build
    ```
    ```diff
    -<a href="https://cse19-iiith.vlabs.ac.in/exp/<exp-name>/"></a>
    +<a href="./exp/<exp-name>/"></a>
    ```

This should create a build folder in the lab directory with all the files that are ready to be deployed.

For more detailed information on configuring and using the lab management tools, refer to the [ph3-lab-mgmt](https://github.com/virtual-labs/ph3-lab-mgmt) repository.

## Containerization

### Details

The Dockerfile prepares a `PHP 8.3` environment with `Apache` and the necessary libraries for handling image processing tasks. It compiles specific simulation C++ files using `OpenCV`, sets up Apache configuration to allow `.htaccess` overrides, and ensures proper permissions and configurations are applied. The container exposes port 80 and starts the Apache server when run.

### Docker Installation

To use Docker for containerization, follow the official Docker [installation documentation](https://docs.docker.com/engine/install/).

### Building and Running the Docker Image
1. Navigate to the lab directory containing the Dockerfile and run the following command to build the Docker image:
    ```
    docker build -t image-processing-lab-image .
    ```
2. After building the image, run the Docker container using the following command:
    ```
    docker run -d --name image-processing-lab -p 1234:80 image-processing-lab-image
    ```

### Usage Instructions
Once the Docker container is running, the application can be accessed by navigating to `http://localhost:1234` in any web browser. This will load the main interface to interact with the various experiments available in the lab.
