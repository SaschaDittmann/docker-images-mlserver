# Microsoft Machine Learning Server (Developer Edition) for Docker

[![](https://img.shields.io/github/license/mashape/apistatus.svg)](https://github.com/SaschaDittmann/docker-images-mlserver)
[![](https://img.shields.io/github/tag/SaschaDittmann/docker-images-mlserver.svg)](https://github.com/SaschaDittmann/docker-images-mlserver)


## Docker Images

This Docker Image is for development & testing purposes ONLY.

[![](https://img.shields.io/docker/pulls/bytesmith/mlserver.svg)](https://hub.docker.com/r/bytesmith/mlserver)
[![](https://img.shields.io/docker/automated/bytesmith/mlserver.svg)](https://hub.docker.com/r/bytesmith/mlserver/builds)

version          | description                               | size 
---------------- | ----------------------------------------- | ------
[![](https://images.microbadger.com/badges/version/bytesmith/mlserver.svg)](https://hub.docker.com/r/bytesmith/mlserver) | Latest build from the [GitHub Repo](https://github.com/SaschaDittmann/docker-images-mlserver) | [![](https://images.microbadger.com/badges/image/bytesmith/mlserver.svg)](https://microbadger.com/images/bytesmith/mlserver)
[![](https://images.microbadger.com/badges/version/bytesmith/mlserver:9.3.0.svg)](https://hub.docker.com/r/bytesmith/mlserver) | Microsoft ML Server 9.3.0 - [GitHub Release](https://github.com/SaschaDittmann/docker-images-mlserver/releases/tag/9.3.0).  | [![](https://images.microbadger.com/badges/image/bytesmith/mlserver:9.3.0.svg)](https://microbadger.com/images/bytesmith/mlserver)
[![](https://images.microbadger.com/badges/version/bytesmith/mlserver:9.2.1.svg)](https://hub.docker.com/r/bytesmith/mlserver) | Microsoft ML Server 9.2.1 - [GitHub Release](https://github.com/SaschaDittmann/docker-images-mlserver/releases/tag/9.2.1).  | [![](https://images.microbadger.com/badges/image/bytesmith/mlserver:9.2.1.svg)](https://microbadger.com/images/bytesmith/mlserver)

## Quickstart

```
docker run -it --rm bytesmith/mlserver
```

### Start Revo64

Run the Revo64 program. By default, Revo64 is installed in the /usr/bin directory:

1. From /Home or any other working directory:
    ```
    [<path>] $ Revo64
    ```

2. Run a RevoScaleR function, such as rxSummary on a dataset. Many sample datasets, such as the iris dataset, are ready to use because they are installed with the software:
    ```
    rxSummary(~., iris)
    ```

Output from the iris dataset should look similar to the following:

```
Rows Read: 150, Total Rows Processed: 150, Total Chunk Time: 0.001 seconds
Computation time: 0.005 seconds.
Call:
rxSummary(formula = ~., data = iris)

Summary Statistics Results for: ~.
Data: iris
Number of valid observations: 150

    Name         Mean     StdDev    Min Max ValidObs MissingObs
    Sepal.Length 5.843333 0.8280661 4.3 7.9 150      0
    Sepal.Width  3.057333 0.4358663 2.0 4.4 150      0
    Petal.Length 3.758000 1.7652982 1.0 6.9 150      0
    Petal.Width  1.199333 0.7622377 0.1 2.5 150      0

Category Counts for Species
Number of categories: 3
Number of valid observations: 150
Number of missing observations: 0

    Species    Counts
    setosa     50
    versicolor 50
    virginica  50
```

To quit the program, type *q()* at the command line with no arguments.

### Start Python

1. From /Home or any other working directory:
    ```
    [<path>] $ mlserver-python
    ```

2. Run a revoscalepy function, such as rx_Summary on a dataset. Many sample datasets are built in. At the Python command prompt, paste the following script:
    ```
    import os
    import revoscalepy 

    sample_data_path = revoscalepy.RxOptions.get_option("sampleDataDir")
    ds = revoscalepy.RxXdfData(os.path.join(sample_data_path, "AirlineDemoSmall.xdf"))

    summary = revoscalepy.rx_summary("ArrDelay+DayOfWeek", ds) 

    print(summary)
    ```

Output from the sample dataset should look similar to the following:

```
Summary Statistics Results for: ArrDelay+DayOfWeek
File name: /opt/microsoft/mlserver/9.3.0/libraries/PythonServer/revoscalepy/data/sample_data/AirlineDemoSmall.xdf
Number of valid observations: 600000.0

       Name       Mean     StdDev   Min     Max  ValidObs  MissingObs
0  ArrDelay  11.317935  40.688536 -86.0  1490.0  582628.0     17372.0

Category Counts for DayOfWeek
Number of categories: 7

            Counts
DayOfWeek
1          97975.0
2          77725.0
3          78875.0
4          81304.0
5          82987.0
6          86159.0
7          94975.0
```

To quit the program, type *quit()* at the command line with no arguments.

## About Microsoft Machine Learning Server

Microsoft Machine Learning Server is your flexible enterprise platform for analyzing data at scale, building intelligent apps, and discovering valuable insights across your business with full support for Python and R.

Machine Learning Server meets the needs of all constituents of the process – from data engineers and data scientists to line-of-business programmers and IT professionals. It offers a choice of languages and features algorithmic innovation that brings the best of open-source and proprietary worlds together.

R support is built on a legacy of Microsoft R Server 9.x and Revolution R Enterprise products. Significant machine learning and AI capabilities enhancements have been made in every release. Python support was added in the previous release. Machine Learning Server supports the full data science lifecycle of your Python-based analytics.

Additionally, Machine Learning Server enables operationalization support so you can deploy your models to a scalable grid for both batch and real-time scoring.

Find more information at https://docs.microsoft.com/en-us/machine-learning-server/what-is-machine-learning-server 
