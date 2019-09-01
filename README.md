# mpi4py_demo

A demonstration of running multi-nodes distributed computing in a single machine with [MPI](https://en.wikipedia.org/wiki/Message_Passing_Interface) and [Docker](https://www.docker.com).


## Getting Started

1. Prerequisites
  - Install Docker. See [Docker Install Instructions](https://docs.docker.com/install/)
  - Install docker-compose. See [Docker Compose Install Instructions](https://docs.docker.com/compose/install/)

2. Git clone
```bash
git clone https://github.com/borgwang/mpi4py_demo.git
```

3. Build Images

```bash
bash scripts/build_docker_base.sh
bash scripts/build_docker_mpi.sh
```

4. Run with docker-compose
```bash
cd mpi4py_demo
docker-compose up -d
```

5. Run Distributed Task
```bash
# enter node-0 container
docker exec -it node-0 bash

# run example task
mpirun --allow-run-as-root -n 20 --hostfile /hostfile python3.6 /mpi4py_demo/hello_world.py
```

output
```
Hello from Host node-0. My rank 4 
Hello from Host node-0. My rank 1 
Hello from Host node-0. My rank 3 
Hello from Host node-1. My rank 7 
Hello from Host node-1. My rank 11 
Hello from Host node-0. My rank 2 
Hello from Host node-1. My rank 6 
Hello from Host node-2. My rank 15 
Hello from Host node-0. My rank 0 
Hello from Host node-2. My rank 13 
Hello from Host node-3. My rank 23 
Hello from Host node-2. My rank 14 
Hello from Host node-3. My rank 18 
Hello from Host node-3. My rank 19 
Hello from Host node-4. My rank 24 
Hello from Host node-4. My rank 27 
Hello from Host node-4. My rank 29 
Hello from Host node-0. My rank 5 
Hello from Host node-1. My rank 8 
Hello from Host node-4. My rank 25 
Hello from Host node-3. My rank 20 
Hello from Host node-1. My rank 10 
Hello from Host node-2. My rank 16 
Hello from Host node-2. My rank 12 
Hello from Host node-4. My rank 28 
Hello from Host node-1. My rank 9 
Hello from Host node-2. My rank 17 
Hello from Host node-4. My rank 26 
Hello from Host node-3. My rank 22 
Hello from Host node-3. My rank 21 
```


