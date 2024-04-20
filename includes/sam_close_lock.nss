void main()
{
    DelayCommand(10.0, ActionCloseDoor(OBJECT_SELF));
    DelayCommand(11.0, SetLocked(OBJECT_SELF, TRUE));
}
