#include <math.h>
#include <float.h>
#include <cuda.h>

__global__ void gpu_Heat (float *h, float *g, float *residual,int N) {
	int i = (blockIdx.x * blockDim.x) + threadIdx.x + 1;
	int j = (blockIdx.y * blockDim.y) + threadIdx.y + 1;
 	if( i < N-1 && j < N-1) {
		int pos = (i*N)+j;
		g[pos]= 0.25 * (h[pos-1] + h[pos+1] + h[pos+N] + h[ pos-N ]);
  		residual[pos] = g[pos] - h[pos];
  		residual[pos] *= residual[pos];
	}
}

__device__ void warpReduce(volatile float* sdata, int tid) {
    sdata[tid] += sdata[tid + 32];
    sdata[tid] += sdata[tid + 16];
    sdata[tid] += sdata[tid + 8];
    sdata[tid] += sdata[tid + 4];
    sdata[tid] += sdata[tid + 2];
    sdata[tid] += sdata[tid + 1];
}

// Slide 22 : http://developer.download.nvidia.com/assets/cuda/files/reduction.pdf 
__global__ void gpu_reduction (float *g_idata, float *g_odata) {
	extern __shared__ float sdata[];
	
	unsigned int tid = threadIdx.x;
	unsigned int i = blockIdx.x*blockDim.x + threadIdx.x;
	sdata[tid] = g_idata[i];
	__syncthreads();

	for(unsigned int s=blockDim.x/2; s>32; s>>=1) {
		if (tid < s)
			sdata[tid] += sdata[tid + s];
		__syncthreads();
	}

	if (tid < 32) warpReduce(sdata, tid);
	if (tid == 0) g_odata[blockIdx.x] = sdata[0];
}
