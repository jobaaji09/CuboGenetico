
#include <stdlib.h>
#include <GL/glut.h>

#include <stdlib.h>

unsigned char mouseFlag=GL_FALSE;             //Flag for moving or not
double        xAngle = 0.0, yAngle = 0.0; //angles of the teapot
int           xStart, yStart;             //start position when drug begins


GLfloat vertices[][3] =
  {
    { -1.0, -1.0, 3.0 },//0
    { 1.0, -1.0, 3.0 },//1
    { 1.0, 1.0, 3.0 },//2
    { -1.0, 1.0, 3.0 },//3
  };

GLfloat colors[][3] = {
  { 0.0, 0.0, 1.0 },
  { 1.0, 0.0, 0.0 },
  { 1.0, 1.0, 0.0 },
  { 0.0, 1.0, 0.0 },
  { 0.0, 0.0, 1.0 },
  { 1.0, 0.0, 1.0 },
  { 1.0, 1.0, 1.0 },
  { 0.0, 1.0, 1.0 },
  { 1.0, 1.0, 0.0 },
  { 1.0, 1.0, 1.0 }
};

void polygon(int color,double x, double y, double z)
{

  /* draw a polygon via list of vertices */
  glTranslatef(x, y, z);
  glBegin(GL_POLYGON);
  glColor3fv(colors[color]);
  glVertex3f(-1.0, -1.0, 0.0);
  glColor3fv(colors[color]);
  glVertex3f(-1.0, 1.0, 0.0);
  glColor3fv(colors[color]);
  glVertex3f(1.0, 1.0, 0.0);
  glColor3fv(colors[color]);
  glVertex3f(1.0, -1.0, 0.0);
  glEnd();
}

void colorcube()
{

  /* map vertices to faces 
  int i,j;
  for (j=0;j<6;j++)
    {
      for(i=0;i<9;i++)
	{
	  if(j<3 && i<3)
	    {
	      glPushMatrix();
	      polygon(i,((double)i),2.0,3.0);
	      glPopMatrix();
	    }

      }
      }*/
  glPushMatrix();
  polygon(2,0.0,2.0,3.0);
  glPopMatrix();
  
  glPushMatrix();
  polygon(4,0.0,0.0,3.0);
  glPopMatrix();

  glPushMatrix();
  polygon(2,0.0,-2.0,3.0);
  glPopMatrix();

  glPushMatrix();
  polygon(2,2.0,0.0,3.0);
  glPopMatrix();
	      
}

static GLfloat theta[] = { 0.0, 1.0, 0.0 };
static GLint axis = 2;

void display()
{

  /* display callback, clear frame buffer and z buffer,
     rotate cube and draw, swap buffers */
  
  glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
  glLoadIdentity();
  glTranslatef(0.0,0.0, 0.0);
  glRotated(xAngle,1.0,0.0,0.0);
  glRotated(yAngle,0.0,1.0,0.0);

  //glRotatef(theta[0], 1.0, 0.0, 0.0);

  //glRotatef(theta[1], 0.0, 1.0, 0.0);
  glRotatef(theta[2], 0.0, 0.0, 1.0);	
  colorcube();
  glFlush ();
  glutSwapBuffers();
}

void spinCube()
{

	/* idle callback, spin cube 2 degrees about selected axis */

	theta[axis] += 0.1;
	if (theta[axis] > 360.0) theta[axis] -= 360.0;
	glutPostRedisplay();
}

void mouse(int btn, int state, int x, int y)
{
  if(btn == GLUT_LEFT_BUTTON && state == GLUT_DOWN){
    xStart = x;
    yStart = y;
    mouseFlag = GL_TRUE;
  }
  else{
    mouseFlag = GL_FALSE;
  }

}

void myMouseMotion(int x, int y)
{
  int xdis,ydis;
  double a =0.5;
  if(mouseFlag == GL_FALSE) return;
  xdis = x-xStart;
  ydis = y-yStart;
  /*To match mouse's movement and its rotation axis*/
  xAngle += (double)ydis *a;
  yAngle += (double)xdis *a;
  xStart = x;
  yStart = y;
  glutPostRedisplay();
}

void keyboard(unsigned char key, int x, int y)
{
   if ( key == 27 ) exit(0);

}

void myReshape(int width, int height)
{
  
  double ratio, a = 6.5;
  
  glViewport(0, 0, width, height);
  glMatrixMode(GL_PROJECTION);
  glLoadIdentity();
  if ( width <= height ){
    ratio = (double)height / (double)width;
    glOrtho( -a, a, -a*ratio, a*ratio, -10.0, 10.0);
  }
  else {
    ratio = (double)width / (double)height;
    glOrtho( -a*ratio, a*ratio, -a, a, -10.0, 10.0);
  }
  glMatrixMode(GL_MODELVIEW);
}

void myInit(char *progname) 
{
  /* need both double buffering and z buffer */

  glutInitDisplayMode(GLUT_SINGLE | GLUT_RGB | GLUT_DEPTH);
  glutInitWindowSize(600, 600); 
  glutInitWindowPosition(300, 300);
  glutCreateWindow(progname);
  glClearColor(1.0, 1.0, 1.0, 0.0);
  glShadeModel(GL_SMOOTH);
}

int main(int argc, char **argv)
{
  glutInit(&argc, argv);
  
  myInit(argv[0]);
  glutReshapeFunc(myReshape);
  glutDisplayFunc(display);
  //glutIdleFunc(spinCube);
  glutMouseFunc(mouse);
  glutMotionFunc(myMouseMotion);
  glutKeyboardFunc(keyboard);
  glEnable(GL_DEPTH_TEST); /* Enable hidden-surface removal */
  glutMainLoop();
  return 0;
}

