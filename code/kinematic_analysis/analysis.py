from math import *

class RobotArm:
	def __init__(self, dimensions):
		self.l0 = dimensions["l0"]
		self.l1 = dimensions["l1"]
		self.l2 = dimensions["l2"]
		self.l3 = dimensions["l3"]
		self.l3i = dimensions["l3i"]
		self.l3o = dimensions["l3o"]
		self.l4 = dimensions["l4"]
		self.l5 = dimensions["l5"]
		self.d = dimensions["d"]
		self.h = dimensions["h"]
		
	def getGripperPosition(self, q1, q2, q3):
		# Calculating Gripper Position
		phi = (q3 + q2) - 90
		f = sqrt((self.l3i**2) + (self.l2**2) - (2 * self.l3i * self.l2 * round(cos(phi))))
		tau = degrees(asin((self.l3i * round(sin(90))) / f))
		mu = degrees(acos((f**2 + self.l3o**2 - self.l4**2) / (2*f*self.l3o)))
		q3o = tau + mu
		r = -(self.l2 * round(cos(q2))) - (self.l3 * round(cos(q2 + q3o)))
		px = self.l0 + ((self.l1 + self.l5 + r) * round(sin(q1))) - (self.d*round(cos(q1)))
		py = -((self.l1 + self.l5 + r) * round(cos(q1))) - (self.d * round(sin(q1)))
		pz = self.h + (self.l2 * round(sin(q2))) + (self.l3 * round(sin(q2 + q3o)))	

		print(f"Px = {px}, Py = {py}, Pz = {pz}") # Printing Gripper Position


# Define Dimensions of the Robot Arm
dimensions = {
	"l0": 5,
	"l1": 15.1,
	"l2": 80,
	"l3": 80,
	"l3i": 23.9,
	"l3o": 35,
	"l4": 80,
	"l5": 52,
	"d": 5,
	"h": 64.5
}

# Creating a Robot Arm Instance
myArm = RobotArm(dimensions)

myArm.getGripperPosition(90, 90, 90)  # This line prints the gripper position when q1 = 90, q2 = 90 and q3 = 90
