package com.team3637.service;

import com.team3637.model.Schedule;

import javax.sql.DataSource;
import java.util.List;

public interface ScheduleService {
    void setDataSource(DataSource dataSource);
    void create(Schedule schedule);
    Schedule getMathById(Integer id);
    Schedule getMatch(Integer matchNum);
    List<Schedule> getTeamsMatches(Integer teamNum);
    List<Schedule> getSchedule();
    void update(Schedule schedule);
    void delete(Integer matchNum);
    void deleteById(Integer id);
}