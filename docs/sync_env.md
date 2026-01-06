## 同步运行环境

**安装 turbodiffusion**。调整 GCC 编译版本和 NVCC 对应：当前 NVCC 为 12.9，无法使用 GCC 13+，调整为 GCC 11 可以运行：

```bash
apt install gcc-11 g++-11
export CC=gcc-11
export CXX=g++-11

# 从当前源码安装
pip install -e . --no-build-isolation
```

**安装 SageSLA**。从 GitHub 安装：

```bash
pip install git+https://github.com/thu-ml/SpargeAttn.git --no-build-isolation
```

**降低 flash-attn 版本**。使用 2.5.8 可以运行：

```bash
pip uninstall -y flash-attn
pip install flash-attn==2.5.8 --no-build-isolation
```
