# ADCS_HW1
Attitude Determination and Control homework 1. Euler angles propogation with RK4 and Euler's Method.

This repository can also be accessed on https://github.com/efemen/ADCS_HW1/ in case something doesn't work due to zipping.

This homework will not be graded due to the translation task option I have taken. 
Therefore, I have tried to accomplish all the requirements of the guideline without writing a report.

Answers to Section D:
- The expression given for mapping between body angular velocities and Euler angle rates in Section A is based on 3-2-1 sequence.
However, the sequence used in Section C is 3-1-3.

- Yes, since they share the same DCM.

- The sequence of rotation motion. Pitching x degrees first and yawing z degrees after doesn't have the 
same outcome with yawing z degrees first and pitch x degrees later since body axes are changing after each rotation.

- Their convenience. Depending on the reference system, some parameters are more familiar to the application 
(such as orbital elements for 3-1-3) which make them easier to use.
