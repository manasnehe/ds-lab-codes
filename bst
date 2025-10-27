// Implement various operations on a Binary Search Tree, such as insertion, deletion, display, and search.

#include<iostream>
using namespace std;
  struct Node{
    int data;
    Node* right;
    Node* left;
    Node(int x){
        data=x;
        right=left=NULL;
    }
  }; 
  void insert(Node* &root,int x){
    Node* newnode = new Node(x);
     if(root==NULL){
         root=newnode;
     }else{
         if(x < root->data){
           insert(root->left,x);
         }
         else if(x > root->data){
           insert(root->right,x);
         }
     }
  }
  void display(Node* root){
    if(root!=NULL){
       display(root->left);
       cout << root->data <<" ";
       display(root->right);
    }
  }
  void Delete(Node* &root,int x){
    if(root==NULL){
        cout << "No element is present" << endl;
        return;
    }
    if(x < root->data){
        Delete(root->left,x);
    }
    else if(x > root->data){
        Delete(root->right,x);
    }
    else{
        if(root->left==NULL && root->right==NULL){
            delete root;
            root = NULL;
        }
        else if(root->left==NULL){
            Node* temp = root;
            root = root->right;
            delete temp;
        }
        else if(root->right==NULL){
            Node* temp = root;
            root = root->left;
            delete temp;
        }
    }
    cout << "The key is deleted:" << x << endl;
  }
  void search(Node* root,int x){
    if(root==NULL){
        cout << "No element is present" << endl;
        return;
    }
    if(x == root->data){
        cout << x << "is founded";
        return;
    }
    if(x < root->data){
        search(root->left,x);
    }
    else{
        if(x > root->data){
          search(root->right,x);
        }
    }
  }
int main(){
   Node* root=NULL;
   insert(root,55);
   insert(root,87);
   insert(root,39);
   display(root);
   cout << endl;
   insert(root,89);
   insert(root,34);
   display(root);
   cout << endl;
   Delete(root,87);
   display(root);
   cout << endl;
   search(root,89);
   search(root,58);
   return 0;
}
