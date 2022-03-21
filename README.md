# QF105

The QF105 System-on-Chip is an OpenMPW5 tapeout of the QF100 System-on-Chip family.

The QF100 System-on-Chip family is a simple, microcontroller-style system comprised of the following:

 1. A 3-stage, in-order 32-bit Lanai core
 2. DFF-based RAM consisting of 1024 32-bit words (4KB)
 3. A Wishbone interconnect/fabric
 4. An SPI controller
 5. A GPIO controller

<img src="https://object.ceph-eu.hswaw.net/q3k-personal/81225263281a1b7c952f43354fb26eae63ec7970bd382d215303a34800afb8e9.png" width="300">

## Lanai

Lanai is a family of RISC CPUs first introduced by Myricom in their NICs. Since then, its use seems to have mostly shifted to Google, whose engineers have contributed a Lanai target to LLVM. Not much is known about the use of the core inside Google.

The Lanai implementation in the QF100 series SoC targets the instruction set as generated by LLVM, called 'Lanai 11'. It diverges in some aspects from the previous versions of the instruction set as documented by Myricom and as implemented by their network cards, by removing RRR (register-register-register, a.k.a. dual-ALU) instructions, removing the PUNT instruction, and tightening some pipeline timing.

We have a work-in-progress LLD implementation for Lanai and Rust target for Lanai, that will be opensourced (and hopefully upstreamed) soon.

I wrote a [summary about Lanai](https://q3k.org/lanai.html) on my homepage.

## QF100 sources: qfc

The QF100 is built from a 'bundle' of verilog exported from the 'qfc' repository. This bundle contains pre-processed files containing both compiled Bluespec as well as Bluespec standard library code. Each hard macro in the resulting design has a separate Verilog file named the same way.

To update the bundle from qfc:

    $ cd qfc
    $ bazel build //boards/qf100
    $ cp bazel-bin/boards/qf100/qf100/*v ../verilog/rtl/

