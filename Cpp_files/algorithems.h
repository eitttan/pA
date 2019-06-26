#ifndef ALGORITHEMS_H_
#define ALGORITHEMS_H_
#include "classes.h"

class random : public entry {
public:
	random(double lambda, test_params& params);
	int choose_server(test_params& params, server* servers[]);
};

class round_robin : public entry
{
public:
	round_robin(double lambda, test_params& params);
	int choose_server(test_params& params, server* servers[]);
private:
	int server_to_choose_;
};

class jsq : public entry
{
public:
	jsq(double lambda, test_params& params);
	int choose_server(test_params& params, server* servers[]);
private:
	vector <int> queue_sizes_;
};

class jiq : public entry
{
public:
	jiq(double lambda, test_params& params);
	int choose_server(test_params& params, server* servers[]);
	void get_empty_report(test_params& params, int server_index);
	int get_pool_size() const;
private:
	vector<int> idle_servers_;
};

class pi : public entry
{
public:
	pi(double lambda, test_params& params);
	int choose_server(test_params& params, server* servers[]);
	void get_empty_report(test_params& params, int server_index);
	int get_pool_size() const;
private:
	vector<int> idle_servers_;
	int last_idle_server_;
};

class jsp : public server
{
public:
	jsp(int index, double lambda);
	void report_empty_queue(test_params& params, entry* entries[]);
};

class jsp_d2 : public server
{
public:
	jsp_d2(int index, double lambda);
	void report_empty_queue(test_params& params, entry* entries[]);
};

#endif // !ALGORITHEMS_H_