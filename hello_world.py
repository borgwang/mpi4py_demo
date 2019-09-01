import socket

from mpi4py import MPI

COMM = MPI.COMM_WORLD
RANK = COMM.Get_rank()

print("Hello from Host %s. My rank %s " % (socket.gethostname(), RANK))
