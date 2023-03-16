% -------------------------------------------------------------------
%  Generated by MATLAB on 16-Mar-2023 17:09:15
%  MATLAB version: 9.11.0.1769968 (R2021b)
% -------------------------------------------------------------------
                                                              

smiData = struct;
smiData.RigidTransform = struct;
smiData.RigidTransform(1).translation = ...
  [0 -0.35 0];
smiData.RigidTransform(1).angle = 2.0943951023931953;
smiData.RigidTransform(1).axis = [0.57735026918962584 -0.57735026918962584 ...
                                  0.57735026918962584];
smiData.RigidTransform(1).ID = 'B[cylinder_joint-1:-:]';
smiData.RigidTransform(2).translation = ...
  [-0.47838779698046713 -4.9971935378599026 4.9960036108132044E-16];
smiData.RigidTransform(2).angle = 3.1415926535897931;
smiData.RigidTransform(2).axis = [1 0 0];
smiData.RigidTransform(2).ID = 'F[cylinder_joint-1:-:]';
smiData.RigidTransform(3).translation = ...
  [-1.25 0.35 0];
smiData.RigidTransform(3).angle = 2.0943951023931953;
smiData.RigidTransform(3).axis = [0.57735026918962584 0.57735026918962584 ...
                                  0.57735026918962584];
smiData.RigidTransform(3).ID = 'B[cylinder_joint-1:-:cylinder_joint-2]';
smiData.RigidTransform(4).translation = ...
  [0 -0.65000000000000058 1.25];
smiData.RigidTransform(4).angle = 3.1415926535897931;
smiData.RigidTransform(4).axis = [-1 5.7777898331617117E-33 -9.8130778667735982E-17 ...
                                  ];
smiData.RigidTransform(4).ID = 'F[cylinder_joint-1:-:cylinder_joint-2]';
smiData.RigidTransform(5).translation = ...
  [-1.2500000000000002 0.35000000000000003 0];
smiData.RigidTransform(5).angle = 2.0943951023931953;
smiData.RigidTransform(5).axis = [0.57735026918962584 0.57735026918962584 ...
                                  0.57735026918962584];
smiData.RigidTransform(5).ID = 'B[cylinder_joint-2:-:cylinder_joint-3]';
smiData.RigidTransform(6).translation = ...
  [4.4408920985006262E-16 -0.64999999999999991 1.2500000000000002];
smiData.RigidTransform(6).angle = 3.1415926535897931;
smiData.RigidTransform(6).axis = [1 -1.5407439555097897E-33 -3.9252311467094391E-17 ...
                                  ];
smiData.RigidTransform(6).ID = 'F[cylinder_joint-2:-:cylinder_joint-3]';
smiData.RigidTransform(7).translation = ...
  [-0.47838779698046713 -4.9971935378599026 0.35000000000000048];
smiData.RigidTransform(7).angle = 1.5707963267948966;
smiData.RigidTransform(7).axis = [1 0 0];
smiData.RigidTransform(7).ID = 'RootGround[cylinder_joint-1]';
smiData.RigidTransform(8).translation = ...
  [-0.47838779698046713 -4.9971935378599026 1.3500000000000008];
smiData.RigidTransform(8).angle = 2.0943951023931953;
smiData.RigidTransform(8).axis = [0.57735026918962584 -0.57735026918962584 ...
                                  -0.57735026918962584];
smiData.RigidTransform(8).ID = 'RootGround[cylinder_joint-2]';
smiData.Solid = struct;
smiData.Solid.mass = 7.1437706173698092E-6;
smiData.Solid.CoM = [-5.0215185942015867E-6 0.18825214754673189 1.4575758212514265E-5 ...
                     ];
smiData.Solid.MoI = [7.0951920145499356E-6 1.3936672161771973E-5 8.7125885445577519E-6 ...
                     ];
smiData.Solid.PoI = [0 0 0];
smiData.Solid.color = [1 1 1];
smiData.Solid.opacity = 1;
smiData.Solid.ID = 'cylinder_joint*:*默认';
smiData.PlanarJoint = struct;
smiData.PlanarJoint.Rz = struct;
smiData.PlanarJoint.Rz.Pos = -89.999999999999986;
smiData.PlanarJoint.Px = struct;
smiData.PlanarJoint.Px.Pos = 0;
smiData.PlanarJoint.Py = struct;
smiData.PlanarJoint.Py.Pos = 0;
smiData.PlanarJoint.ID = '[cylinder_joint-1:-:]';
smiData.RevoluteJoint = struct;
smiData.RevoluteJoint(1).Rz = struct;
smiData.RevoluteJoint(1).Rz.Pos = 89.999999999999986;
smiData.RevoluteJoint(1).ID = '[cylinder_joint-1:-:cylinder_joint-2]';
smiData.RevoluteJoint(2).Rz = struct;
smiData.RevoluteJoint(2).Rz.Pos = 89.999999999999986;
smiData.RevoluteJoint(2).ID = '[cylinder_joint-2:-:cylinder_joint-3]';

