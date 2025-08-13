#include <QMessageBox>
#include <QApplication>
int main(int argc, char *argv[])
{
    QApplication app(argc, argv);
    QMessageBox::about(nullptr, "Test", "Hello World");
}
