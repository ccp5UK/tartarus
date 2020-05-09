#!/usr/bin/env python3


from ase.lattice.cubic import FaceCenteredCubic
from ase.io import write


atoms = FaceCenteredCubic(symbol='Ar', latticeconstant=5.26, size=(6,6,6))

write("lmp/Ar.lmp",atoms,format="lammps-data")
write("dlp/Ar.config", atoms)
