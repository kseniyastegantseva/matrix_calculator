FROM ubuntu:22.04

RUN apt-get update && apt-get install -y \
    g++ \
    cmake \
    doxygen \
    graphviz \
    make \
    git \
    && rm -rf /var/lib/apt/lists/*

# Устанавливаем GTest вручную
RUN git clone https://github.com/google/googletest.git /opt/googletest && \
    cd /opt/googletest && \
    mkdir build && \
    cd build && \
    cmake .. && \
    make && \
    make install

WORKDIR /app
COPY . .

RUN rm -rf build && \
    mkdir build && \
    cd build && \
    cmake .. && \
    make

RUN doxygen Doxyfile

CMD ["./build/matrix_calculator"]
