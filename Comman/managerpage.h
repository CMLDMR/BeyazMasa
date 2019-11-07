#ifndef MANAGERPAGE_H
#define MANAGERPAGE_H

#include <QObject>
#include <QQmlListProperty>



class PageSubClass : public QObject
{
    Q_OBJECT

public:
    PageSubClass(QObject *parent = nullptr):QObject(parent){}



signals:
    void listChanged();
};


template<typename  T>
class ManagerPage : public PageSubClass
{
public:
    explicit ManagerPage(QObject *parent = nullptr ):PageSubClass(parent){}
    ~ManagerPage(){
        mItemlist.clear ();
    }

    QQmlListProperty<T> list();

    void insertModel(T item);



private:
    QList<T> mItemlist;


    static void appendList(QQmlListProperty<T> *property, T *note)
    {
        Q_UNUSED(property)
        Q_UNUSED(note)
    }
    static T* cardAt(QQmlListProperty<T> *property, int index)
    {
        return static_cast<QList<T*>*>(property->data)->at(index);
    }
    static int listSize(QQmlListProperty<T> *property)
    {
        return static_cast<QList<T*>*>(property->data)->size();
    }
    static void clearListPtr(QQmlListProperty<T> *property)
    {
        static_cast<QList<T*>*>(property->data)->clear ();
    }



};

template<typename T>
QQmlListProperty<T> ManagerPage<T>::list()
{
    return QQmlListProperty<T>(this,&mItemlist,
                               &ManagerPage::appendList ,
                               &ManagerPage::listSize ,
                               &ManagerPage::cardAt ,
                               &ManagerPage::clearListPtr);
}


template<typename T>
void ManagerPage<T>::insertModel(T item)
{
    mItemlist.append (item);
    emit listChanged();
}




#endif // MANAGERPAGE_H
